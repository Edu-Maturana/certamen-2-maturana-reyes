import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Body,
  Param,
  HttpStatus,
} from '@nestjs/common';

import { CarsService } from '../provider/cars.service';
import { CarsDTO } from '../dtos/cars.dto';

@Controller('cars')
export class CarsController {
  constructor(private carsService: CarsService) {}

  @Get()
  async getAll() {
    const cars = await this.carsService.getAll();

    return {
      statusCode: HttpStatus.OK,
      data: cars,
    };
  }

  @Get(':id')
  async getOne(@Param('id') id: number) {
    const car = await this.carsService.getOne(id);

    return {
      statusCode: HttpStatus.OK,
      data: car,
    };
  }

  @Post()
  async create(@Body() data: CarsDTO) {
    return {
      statusCode: HttpStatus.OK,
      data: await this.carsService.create(data),
    };
  }

  @Put(':id')
  async update(@Param('id') id: number, @Body() data: Partial<CarsDTO>) {
    return {
      statusCode: HttpStatus.OK,
      data: await this.carsService.update(id, data),
    };
  }

  @Delete(':id')
  async delete(@Param('id') id: number) {
    return {
      statusCode: HttpStatus.OK,
      data: await this.carsService.delete(id),
    };
  }
}
