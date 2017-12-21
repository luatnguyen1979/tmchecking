import {Injectable} from '@angular/core';
import {Router} from '@angular/router';
import {HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
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
        for (const obj of res) { counselors.push(obj); }
      });
      return counselors;
    }
  }

  public createSession(http: HttpClient, date: Date, frame: string, counselor: string) {
    const  params = JSON.stringify({'date': date, 'timeframe': frame, 'counselorId' : counselor, 'duration' : '30 minutes'});
    const headers = new HttpHeaders({ 'Content-Type': 'application/json'});
    headers.set('Access-Control-Allow-Origin', '*');
    headers.set('Access-Control-Allow-Methods', 'GET, POST, PATCH, PUT, DELETE, OPTIONS');
    headers.set('Access-Control-Allow-Headers', 'Origin, Content-Type, X-Auth-Token');
    console.log('Params to create session:')
    console.log(params);
    http.post(ServerConfiguration._url + '/sessions', params, {headers: headers}).subscribe((res) => {
     console.log('Create new session successfully!');
     alert('Create new session successfully!');
    });

  }

  /* ACTION BUTTON */
  public acknowledge(http: HttpClient, sessionId: string, urlReload: string): Array<Session> {
    http.put(ServerConfiguration._url + '/sessions/acknowledge/' + sessionId, {}).subscribe(
      (res) => {
        console.log('Acknowledge successfully !!!');
        return this.getSessionsByUrl(http, urlReload);
      }
    );
    return new Array<Session>();
  }

  public book(http: HttpClient, sessionId: string, userId: string, urlReload: string): Array<Session> {
    http.put(ServerConfiguration._url + '/sessions/book/' + sessionId + '/' + userId, {}).subscribe(
      (res) => {
        console.log('Book successfully !!!');
        return this.getSessionsByUrl(http, urlReload);
      }
    );
    return new Array<Session>();
  }

  public reject(http: HttpClient, sessionId: string, urlReload: string): Array<Session> {
    let sessions = new Array<Session>();
    http.put(ServerConfiguration._url + '/sessions/reject/' + sessionId, {'id': sessionId}).subscribe(
      (res) =>  {
        console.log('Reject successfully !!!')
        console.log(this.getSessionsByUrl(http, urlReload));
        sessions = this.getSessionsByUrl(http, urlReload);
      }
    );
    console.log('aaa');
    console.log(sessions);
    return sessions;
  }

  public cancel(http: HttpClient, sessionId: string, urlReload: string): Array<Session>  {
    http.put(ServerConfiguration._url + '/sessions/cancel/' + sessionId, {'id': sessionId}).subscribe(
      (res) =>  {
        console.log('Cancel successfully !!!')
        return this.getSessionsByUrl(http, urlReload);
      }
    );
    return new Array<Session>();
  }

  public complete(http: HttpClient, sessionId: string, urlReload: string): Array<Session>  {
    http.put(ServerConfiguration._url + '/sessions/complete/' + sessionId, {'id': sessionId}).subscribe(
      (res) =>  {
        console.log('Complete successfully !!!');
        return this.getSessionsByUrl(http, urlReload);
      }
    );
    return new Array<Session>();
  }
}
