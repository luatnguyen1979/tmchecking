import {Pipe, PipeTransform} from '@angular/core';
import {Session} from '../models/session';

@Pipe({name: 'filter'})
export class FilterPipe implements PipeTransform {
  transform(sessions: Array<Session>, status: string) {
    if (!sessions) {
      return new Array<Session>();
    }

    // console.log('input:');
    // console.log(sessions);
    const result = new Array<Session>();
    for (const ss of sessions){
      // console.log('d' + ss.status);
      // console.log(status);
      if (ss.status === status) {
        result.push(ss);
      }
    }
    return result;
    // return sessions.filter((item) => item.status === status);
  }
}
