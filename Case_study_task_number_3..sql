-- Создание базы данных
DROP DATABASE IF EXISTS tourism;
CREATE DATABASE tourism;
USE tourism;

-- 1. Таблица-справочник: Клиенты
CREATE TABLE clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) NOT NULL
);

-- 2. Таблица-справочник: Туры
CREATE TABLE tours (
    tour_id INT PRIMARY KEY AUTO_INCREMENT,
    tour_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    duration_days INT NOT NULL
);

-- 3. Таблица-справочник: Дополнительные услуги
CREATE TABLE services (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    service_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

-- 4. Таблица переменной информации: Заказы
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT NOT NULL,
    tour_id INT NOT NULL,
    service_id INT NOT NULL,
    order_date DATE NOT NULL,
    status ENUM('pending', 'confirmed', 'completed', 'canceled') NOT NULL,
    
    -- Внешние ключи
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (tour_id) REFERENCES tours(tour_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);
