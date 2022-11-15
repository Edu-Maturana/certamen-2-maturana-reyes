import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity('cars')
export class CarsEntity {
  @PrimaryGeneratedColumn()
  vin: number;

  @Column()
  brand: string;

  @Column()
  model: string;

  @Column()
  year: string;

  @Column()
  price: number;
}
