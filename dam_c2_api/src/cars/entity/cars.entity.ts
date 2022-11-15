import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity('tours')
export class ToursEntity {
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
