import { IsDefined, IsNotEmpty, IsNumber, IsPositive } from 'class-validator';

export class CarsDTO {
  @IsDefined()
  @IsNotEmpty()
  vin: string;

  @IsDefined()
  @IsNotEmpty()
  brand: string;

  @IsDefined()
  @IsNotEmpty()
  model: string;

  @IsDefined()
  @IsNotEmpty()
  @IsNumber()
  year: number;

  @IsDefined()
  @IsNotEmpty()
  @IsNumber()
  @IsPositive()
  price: number;
}
