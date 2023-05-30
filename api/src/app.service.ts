import { Injectable } from '@nestjs/common';
import { APIResponse } from './app.types';

@Injectable()
export class AppService {
  basicResponse(): APIResponse {
    const response = {
      message: 'Automate all the things!',
      timestamp: 1529729125,
    };
    return response;
  }
}
