import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-test',
  templateUrl: './test.component.html',
  styleUrls: ['./test.component.css']
})
export class TestComponent implements OnInit {
  public myId = "123";
  public isDisabled : boolean = true;
  public hasError = true;
  public successClass = "text-success";


  constructor() { }

  ngOnInit(): void {
  }

}
