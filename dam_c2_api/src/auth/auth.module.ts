import { Module } from '@nestjs/common';
import { AuthService } from './provider/auth.service';
import { AuthConfig } from './auth.config';
import { AuthController } from './controller/auth.controller';

@Module({
  providers: [AuthService, AuthConfig],
  controllers: [AuthController],
})
export class AuthModule {}
