# Первый этап - сборка приложения
FROM golang:1.20 AS builder

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем исходный код в контейнер
COPY . .

# Сборка приложения с отключением CGO
RUN GOOS=linux go build -o hello .

# Открываем порт 8080
EXPOSE 8080

# Запуск приложения
CMD ["/hello"]
