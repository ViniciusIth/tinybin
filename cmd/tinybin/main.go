package main

import (
	"log"

	"github.com/viniciusith/tinybin/internal/database"
)

func main() {
	db, err := database.NewDatabase("postgres://postgres:pasword@localhost:5432/tinybin?sslmode=disable")
	if err != nil {
		log.Fatalf("Failed to connect to database \n\t%s", err.Error())
	}

	defer db.Close()
}
