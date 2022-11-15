import { Module } from '@nestjs/common';
import { CarsController } from './controller/cars.controller';
import { CarsService } from './provider/cars.service';

@Module({
  controllers: [CarsController],
  providers: [CarsService],
})
export class CarsModule {}
