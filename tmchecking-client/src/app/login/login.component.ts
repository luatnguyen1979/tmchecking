import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {LoginService} from '../services/login.service';
import {Router} from '@angular/router';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  constructor (private http: HttpClient, private loginService: LoginService, private router: Router) {}

  loginForm = new FormGroup({
    username: new FormControl('', [Validators.required]),
    password: new FormControl('', [Validators.required])
  });

  login() {
    this.loginService.login(this.http, this.loginForm.get('username').value, this.loginForm.get('password').value);
    // this.router.navigate(['/']);
  }

  ngOnInit() {
  }

}
