import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CarsController } from './controller/cars.controller';
import { CarsEntity } from './entity/cars.entity';
import { CarsService } from './provider/cars.service';

@Module({
  imports: [TypeOrmModule.forFeature([CarsEntity])],
  controllers: [CarsController],
  providers: [CarsService],
})
export class CarsModule {}
