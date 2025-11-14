<?php
$host = '172.64.149.246';
$port = '5432';
$db   = 'postgres';
$user = 'postgres';
$pass = 'oDelzXh4Cd28yCIy';

try {
    $pdo = new PDO("pgsql:host=$host;port=$port;dbname=$db;sslmode=require", $user, $pass);
    echo "Connected successfully!";
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
