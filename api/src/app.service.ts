import { Injectable } from '@nestjs/common';
import { APIResponse } from './app.types';

@Injectable()
export class AppService {
  basicResponse(): APIResponse {
    const response = {
      message: 'Automate all the things!',
      // timestamp: Date.now(),
    };
    return response;
  }
}
