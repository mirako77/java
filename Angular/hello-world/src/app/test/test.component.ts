import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-test',
  templateUrl: './test.component.html',
  styleUrls: ['./test.component.css']
})
export class TestComponent implements OnInit {
  public myId = "123";
  public isDisabled : boolean = true
  public hasError = true;
  public successClass = "text-success";
  public youClickMe = "";

  constructor() { }

  ngOnInit(): void {
  }

  onClick(event){
    console.log(event.type)
    this.youClickMe = "You click the button !" 
  }

  logMessage(inputValue){
    console.log(inputValue); /**** >> fait référence a l'objet du DOM */
    console.log('Ceci est la valeur de inputValue :'+inputValue);
  }

}