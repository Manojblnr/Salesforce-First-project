import { LightningElement, api } from 'lwc';

export default class Child extends LightningElement {
    uppercaseItemName = 'Default value';

    @api
    get itemName(){
        return this.uppercaseItemName;
    }

    set itemName(value){
        this.uppercaseItemName = value.toUpperCase();
    }
}