import {Injectable} from '@angular/core';
import {Router} from '@angular/router';
import {HttpClient, HttpParams} from '@angular/common/http';
import {Session} from '../models/session';
import {ServerConfiguration} from '../consts/server.config';
import {User} from '../models/user';

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
    http.get<Session[]>(url).subscribe((res) => {
      for (const obj of res) { sessions.push(obj); }
    });
    return sessions;
  }

  public getCounselors(http: HttpClient): Array<User> {
    const counselors: User[] = new Array();
    if (localStorage != null) {
      const url = ServerConfiguration._url + '/users/counselor';
      const isCounselor = (localStorage.getItem('role') === 'Counselor') ? 'true' : 'false';
      http.get<User[]>(url).subscribe((res) => {
        // console.log(res);
        for (const obj of res) { counselors.push(obj); }
      });
      return counselors;
    }
  }

  public createSession(http: HttpClient, date: Date, frame: string, counselor: string) {
    const params = JSON.stringify({date: date, timeFrame: frame, counselorId: counselor, duration: '30 minutes'});
    http.post(ServerConfiguration._url + '/sessions', params).subscribe((res) => {
      console.log('Create new session successfully!');
    });
  }

  public acknowledge(http: HttpClient, sessionId: string) {
    http.put(ServerConfiguration._url + '/sessions/acknowledge', {'id': sessionId});
  }

  public book(http: HttpClient, sessionId: string, userId: string) {
    http.put(ServerConfiguration._url + '/sessions/book', {'id': sessionId, 'userid': userId});
  }

  public reject(http: HttpClient, sessionId: string) {
    http.put(ServerConfiguration._url + '/sessions/reject', {'id': sessionId});
  }

  public cancel(http: HttpClient, sessionId: string) {
    http.put(ServerConfiguration._url + '/sessions/cancel', {'id': sessionId});
  }

  public complete(http: HttpClient, sessionId: string) {
    http.put(ServerConfiguration._url + '/sessions/cancel', {'id': sessionId});
  }
}
