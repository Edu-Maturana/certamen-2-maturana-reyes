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

import { ToursService } from '../provider/tours.service';
import { ToursDTO } from '../dtos/tours.dto';

@Controller('tours')
export class ToursController {
  constructor(private toursService: ToursService) {}

  @Get()
  async getAll() {
    return {
      statusCode: HttpStatus.OK,
      data: await this.toursService.getAll(),
    };
  }

  @Get(':id')
  async getOne(@Param('id') id: number) {
    return {
      statusCode: HttpStatus.OK,
      data: await this.toursService.getOne(id),
    };
  }

  @Post()
  async create(@Body() data: ToursDTO) {
    return {
      statusCode: HttpStatus.OK,
      data: await this.toursService.create(data),
    };
  }

  @Put(':id')
  async update(@Param('id') id: number, @Body() data: Partial<ToursDTO>) {
    return {
      statusCode: HttpStatus.OK,
      data: await this.toursService.update(id, data),
    };
  }

  @Delete(':id')
  async delete(@Param('id') id: number) {
    return {
      statusCode: HttpStatus.OK,
      data: await this.toursService.delete(id),
    };
  }
}
