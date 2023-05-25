import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { APIResponse } from './app.types';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  basicResponse(): APIResponse {
    return this.appService.basicResponse();
  }
}
