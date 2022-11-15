import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

import { CarsEntity } from '../entity/cars.entity';
import { CarsDTO } from '../dtos/cars.dto';

@Injectable()
export class CarsService {
  constructor(
    @InjectRepository(CarsEntity)
    private carsRepository: Repository<CarsEntity>,
  ) {}

  async getAll() {
    return await this.carsRepository.find({
      where: { available: true },
    });
  }

  async getOne(vin: string) {
    return await this.carsRepository.findOne({
      where: { vin },
    });
  }

  async create(data: CarsDTO) {
    const tour = this.carsRepository.create(data);
    await this.carsRepository.save(tour);
    return tour;
  }

  async update(vin: string, data: Partial<CarsDTO>) {
    await this.carsRepository.update({ vin }, data);
    return this.carsRepository;
  }

  async delete(vin: string) {
    await this.carsRepository.update(
      { vin },
      { available: false, deleted_at: new Date() },
    );
    return { deleted: true };
  }
}
