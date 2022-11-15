import { Entity, Column, PrimaryGeneratedColumn, PrimaryColumn } from 'typeorm';

@Entity('cars')
export class CarsEntity {
  @PrimaryColumn()
  vin: string;

  @Column()
  brand: string;

  @Column()
  model: string;

  @Column()
  year: number;

  @Column()
  price: number;

  // add now date to a field called created at
  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  created_at: Date;

  // add now date to a field called updated at
  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  updated_at: Date;

  // add null to a field called deleted at
  @Column({ type: 'timestamp', nullable: true })
  deleted_at: Date;
}
