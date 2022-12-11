import { Module } from '@nestjs/common';
import { AuthService } from './provider/auth.service';
import { AuthController } from './controller/auth.controller';
import { AuthConfig } from './auth.config';
import { PassportModule } from '@nestjs/passport';
import { JwtStrategy } from './controller/jwt.strategy';

@Module({
  imports: [PassportModule.register({ defaultStrategy: 'jwt' })],
  providers: [AuthConfig, AuthService, JwtStrategy],
  controllers: [AuthController],
})
export class AuthModule {}
