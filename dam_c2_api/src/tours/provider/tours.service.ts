import { Injectable, HttpStatus } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

import { ToursEntity } from '../entity/tours.entity';
import { ToursDTO } from '../dtos/tours.dto';

@Injectable()
export class ToursService {
  constructor(
    @InjectRepository(ToursEntity)
    private toursRepository: Repository<ToursEntity>,
  ) {}

  async getAll() {
    return await this.toursRepository.find();
  }

  async getOne(id: number) {
    return await this.toursRepository.findOne({
      where: { id },
    });
  }

  async create(data: ToursDTO) {
    const tour = await this.toursRepository.create(data);
    await this.toursRepository.save(tour);
    return tour;
  }

  async update(id: number, data: Partial<ToursDTO>) {
    await this.toursRepository.update({ id }, data);
    return await this.toursRepository;
  }

  async delete(id: number) {
    await this.toursRepository.delete({ id });
    return { deleted: true };
  }
}
