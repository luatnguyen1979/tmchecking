import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {LoginService} from '../services/login.service';
import {Router} from '@angular/router';
import {User} from '../models/user';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  constructor (private http: HttpClient, private loginService: LoginService, private router: Router) {}

  loginForm = new FormGroup({
    email: new FormControl('', [Validators.required]),
    password: new FormControl('', [Validators.required])
  });

  login() {
    if (this.loginService.login(this.router, this.http, this.loginForm.get('email').value, this.loginForm.get('password').value)) {
      console.log('Login successfully -> Navigate to Home component!');
    }
  }

  ngOnInit() {
  }
}
