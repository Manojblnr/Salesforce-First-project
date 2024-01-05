import { LightningElement } from 'lwc';
import templateOne from './templateOne.html';
import templateTwo from './templateTwo.html';

export default class MiscMultipleTemplates extends LightningElement {
    templateOneVar = true;

    render(){
        return this.templateOneVar ? templateOne : templateTwo;
    }

    switchTemplate(){
        this.templateOneVar = this.templateOneVar === true ? false : true;
    }
}