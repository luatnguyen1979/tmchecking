import {Injectable} from '@angular/core';
import {Router} from '@angular/router';
import {HttpClient, HttpParams} from '@angular/common/http';
import {Session} from '../models/session';
import {ServerConfiguration} from '../consts/server.config';

@Injectable()
export class SessionService {
  constructor ( private router: Router ) {}

  public getSessions(http: HttpClient): Session[] {
    const sessions: Session[] = new Array();
    const url = ('/sessions/' + localStorage.getItem('id'));
    const isCounselor =  (localStorage.getItem('role') === 'Counselor') ? 'true' : 'false';
    http.get<Session[]>(ServerConfiguration._url + url + '/' + isCounselor).subscribe((res) => {
        for (const obj of res) {
          sessions.push(obj);
        } });
    // console.log(sessions);
    return sessions;
  }
}
