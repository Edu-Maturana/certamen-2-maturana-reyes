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
    return await this.carsRepository.find();
  }

  async getOne(id: number) {
    return await this.carsRepository.findOne({
      where: { vin: id },
    });
  }

  async create(data: CarsDTO) {
    const tour = await this.carsRepository.create(data);
    await this.carsRepository.save(tour);
    return tour;
  }

  async update(id: number, data: Partial<CarsDTO>) {
    await this.carsRepository.update({ vin: id }, data);
    return await this.carsRepository;
  }

  async delete(id: number) {
    await this.carsRepository.delete({ vin: id });
    return { deleted: true };
  }
}
