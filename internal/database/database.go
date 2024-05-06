package database

import (
	"context"
	"errors"

	"github.com/jackc/pgx/v5/pgxpool"
)

type Database struct {
	Pool *pgxpool.Pool
}

func NewDatabase(connectionString string) (*Database, error) {
	pool, err := pgxpool.New(context.Background(), connectionString)
	if err != nil {
		return nil, err
	}

	if _, err := pool.Acquire(context.Background()); err != nil {
		return nil, err
	}

	return &Database{Pool: pool}, nil
}

func (d *Database) Close() error {
	if d.Pool != nil {
		d.Pool.Close()
		return nil
	}

	return errors.New("Tried to close nil database")
}
