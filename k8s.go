package main

import (
    "context"
    "fmt"
    "k8s.io/client-go/kubernetes"
    metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
    "k8s.io/client-go/tools/clientcmd"
    "k8s.io/apimachinery/pkg/util/intstr"
    apps "k8s.io/api/apps/v1"
)

func main() {
    kubeconfig := "/path/to/your/kubeconfig" // replace with your kubeconfig path
    config, err := clientcmd.BuildConfigFromFlags("", kubeconfig)
    if err != nil {
        panic(err)
    }

    clientset, err := kubernetes.NewForConfig(config)
    if err != nil {
        panic(err)
    }

    deploymentClient := clientset.AppsV1().Deployments("default")

    scale := &apps.Scale{
        ObjectMeta: metav1.ObjectMeta{
            Name:      "myapp-deployment",
            Namespace: "default",
        },
        Spec: apps.ScaleSpec{
            Replicas: int32(5),
        },
    }

    _, err = deploymentClient.UpdateScale(context.TODO(), "myapp-deployment", scale, metav1.UpdateOptions{})
    if err != nil {
        panic(err)
    }

    fmt.Println("Scaled deployment successfully")
}