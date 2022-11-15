import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ToursController } from './controller/tours.controller';
import { ToursService } from './provider/tours.service';
import { ToursEntity } from './entity/tours.entity';

@Module({
  imports: [TypeOrmModule.forFeature([ToursEntity])],
  providers: [ToursService],
  controllers: [ToursController],
})
export class ToursModule {}
