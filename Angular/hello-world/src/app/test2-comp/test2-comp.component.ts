import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';

/**
 * Exemple d'utilisation du transfert de data entre un parent: app.component et le fils: test2-comp.component
 */
@Component({
  selector: 'app-test2-comp',
  // templateUrl: './test2-comp.component.html',
  template: `
        <p>{{ " hello " + name }}</p>
        <button (click)="fireEvent()">send Event</button>
        `,
  styleUrls: ['./test2-comp.component.css']
})
export class Test2CompComponent implements OnInit {

  @Input("parentData") public name;

  @Output() 
  public childEvent = new EventEmitter();

  constructor() { }

  ngOnInit(): void {
  }

  fireEvent(){
    console.log('I m in fireEvent');
    this.childEvent.emit('Hey RaMicka !');
  }

}
