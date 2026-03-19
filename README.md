# Infraestructura con Docker y Kubernetes

## Descripción del proyecto

Este proyecto implementa una arquitectura de despliegue basada en prácticas DevOps, utilizando contenedores con Docker y Kubernetes. 
Se construye un servicio web escalable y resiliente.

---

## Objetivos

* Contenerizar una aplicación web usando Docker
* Desplegar la aplicación en un clúster de Kubernetes
* Implementar balanceo de carga mediante Services
* Configurar escalabilidad automática con HPA
* Validar resiliencia ante fallos
* Automatizar la infraestructura mediante Terraform

---

## Arquitectura de la solución

La arquitectura sigue el siguiente flujo:

Usuario → Kubernetes Service → Deployment → Pods → Contenedor(Docker) → Aplicación(Node.js)

### Componentes:

* Service: expone la aplicación y balancea la carga
* Deployment: gestiona el estado deseado de los pods
* Pods: ejecutan los contenedores de la aplicación
* Docker: empaqueta la aplicación y sus dependencias
* HPA: ajusta automáticamente el número de pods

---

## Estructura del proyecto

```
k8-project/
│
├── app/
│   ├── package.json
│   └── server.js
│
├── Dockerfile
│
├── kubernetes/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── hpa.yaml
│
├── terraform/
│   └── main.tf
│
└── README.md
```

---

## Paso 1: Construcción del contenedor

Construcción de la imagen Docker:

```
docker build -t k8-project .
```

Ejecución local:

```
docker run -p 3000:3000 k8-project
```

---

## Paso 2: Despliegue en Kubernetes

Iniciar Minikube:

```
minikube start
```

Aplicar configuración:

```
kubectl apply -f kubernetes/
```

Verificar recursos:

```
kubectl get pods
kubectl get services
```

Obtener URL del servicio:

```
minikube service k8-project-service --url
```

---

## Paso 3: Escalabilidad automática (HPA)

Aplicar autoscaler:

```
kubectl apply -f kubernetes/hpa.yaml
```

Ver estado:

```
kubectl get hpa
```

Simulación de carga:

```
kubectl run -i --tty load-generator --rm --image=busybox -- /bin/sh
```

Dentro del contenedor:

```
while true; do wget -q -O- http://k8-project-service; done
```

---

## Paso 4: Prueba de resiliencia

Eliminar un pod:

```
kubectl delete pod <nombre-del-pod>
```

Verificar recreación automática:

```
kubectl get pods
```

---

## Paso 5: Infraestructura como Código (Terraform)

Inicializar Terraform:

```
terraform init
```

Aplicar configuración:

```
terraform apply
```

---

## Evidencias de funcionamiento

Se incluyen:

* Capturas de creación de contenedor Docker
* Despliegue en Kubernetes
* Prueba de eliminación de pods y recuperación


## Tecnologías utilizadas

* Docker
* Kubernetes
* Minikube
* Kubectl
* Terraform
* Node.js

## Autor
Julio Ceasar Murcia Paez
