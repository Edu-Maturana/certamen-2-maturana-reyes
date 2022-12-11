import { Module } from '@nestjs/common';
import { AuthService } from './provider/auth.service';
import { AuthConfig } from './auth.config';

@Module({
  providers: [AuthService, AuthConfig],
})
export class AuthModule {}
