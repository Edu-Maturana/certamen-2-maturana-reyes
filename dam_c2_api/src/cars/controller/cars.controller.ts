import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Body,
  Param,
  HttpStatus,
  ParseIntPipe,
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

  @Get(':vin')
  async getOne(@Param('vin') vin: string) {
    const car = await this.carsService.getOne(vin);

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

  @Put(':vin')
  async update(@Param('vin') vin: string, @Body() data: Partial<CarsDTO>) {
    return {
      statusCode: HttpStatus.OK,
      data: await this.carsService.update(vin, data),
    };
  }

  @Delete(':vin')
  async delete(@Param('vin') vin: string) {
    return {
      statusCode: HttpStatus.OK,
      data: await this.carsService.delete(vin),
    };
  }
}
