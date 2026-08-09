package main

import "fmt"

func Hello(name string) string {
	message := fmt.Sprintf("Hi, %v. Welcome Masterfabric!", name)
	return message
}

func main() {
	fmt.Println(Hello("Talha"))
	var age int = 19
	height := 1.7
	student := "Masterfabric"
	fmt.Println("My age is", age)
	fmt.Println("My height is", height)
	fmt.Println("I am Student of", student)
}