import {Injectable} from '@angular/core';
import {Router} from '@angular/router';
import {HttpClient, HttpParams} from '@angular/common/http';
import {Session} from '../models/session';
import {ServerConfiguration} from '../consts/server.config';

export class SessionService {
  constructor ( ) {}

  public getSessions(http: HttpClient): Array<Session> {
    const sessions: Session[] = new Array();
    if (localStorage != null) {
      const url = (ServerConfiguration._url + '/sessions/' + localStorage.getItem('id'));
      const isCounselor = (localStorage.getItem('role') === 'Counselor') ? 'true' : 'false';
      http.get<Session[]>(url + '/' + isCounselor).subscribe((res) => {
        for (const obj of res) { sessions.push(obj); }
      });
      return sessions;
    }
  }

  public getSessionsByUrl(http: HttpClient, url: string): Array<Session> {
    const sessions: Session[] = new Array();
    if (localStorage != null) {
      http.get<Session[]>(url).subscribe((res) => {
        for (const obj of res) { sessions.push(obj); }
      });
      console.log(sessions);
      return sessions;
    }
  }
}
