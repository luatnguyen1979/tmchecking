import {Pipe, PipeTransform} from '@angular/core';
import {Session} from '../models/session';
import {User} from "../models/user";

@Pipe({name: 'filter'})
export class FilterPipe implements PipeTransform {
  transform(sessions: Array<Session>, status: string) {
    if (!sessions) {
      return new Array<Session>();
    }
    const result = new Array<Session>();
    for (const ss of sessions){
      if (ss.status === status) {
        result.push(ss);
      }
    }
    return result;
  }
}

@Pipe({name: 'name'})
export class NamePipe implements PipeTransform {
  transform(id: string, users: Array<User>) {
    for (const user of users){
      if (user._id === id) {
        return user.firstName + ' ' + user.lastName;
      }
    }
    return id;
  }
}
