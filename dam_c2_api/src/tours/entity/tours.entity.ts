import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity('tours')
export class ToursEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  city: string;

  @Column()
  img: string;

  @Column()
  description: string;

  @Column()
  price: number;

  @Column()
  schedule: string;

  @Column()
  rating: number;
}
