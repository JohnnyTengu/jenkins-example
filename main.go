package main

import (
    "fmt"
    "log"
    "net/http"
)

func helloWorldHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Hello, World!")
}

func main() {
    http.HandleFunc("/", helloWorldHandler)

    port := ":8080"
    fmt.Printf("Сервер запущен на порту %s\n", port)
    if err := http.ListenAndServe(port, nil); err != nil {
        log.Fatalf("Ошибка запуска сервера: %s", err)
    }
}
