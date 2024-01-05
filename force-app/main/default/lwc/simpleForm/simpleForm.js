import { LightningElement } from 'lwc';
import formData from '@salesforce/apex/simpleForm.formData';

export default class SimpleForm extends LightningElement {
    fullName='';
    phoneNumber='';

    // result;

    onHandle(event){
        const field = event.target.name;
        
        if( field === 'name'){
            this.fullName = event.target.value;
            console.log(this.fullName);
        }else if( field === 'phone'){
            this.phoneNumber = event.target.value;
            console.log(this.phoneNumber);
        }
    }

    onSubmit(){
        formData({Name: this.fullName, Phone: this.phoneNumber})
            .then(res => {
                console.log('data added successfully',res)
            }).catch(error => {
                console.log('This error', error)
            });

    }
}