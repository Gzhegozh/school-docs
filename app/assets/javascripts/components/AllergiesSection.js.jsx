class AllergiesSection extends React.Component {
    constructor(props){
        super(props);
    }

    printAllergies(){
        return '';
    }

    addNewAllergy(e){
        e.preventDefault();
    }

    render(){
        return (
          <div>
              <h3>Child's allergies</h3>
              <h4>
                  <small>
                      If your child haven't allergies, ignore this section
                  </small>
              </h4>
              <hr/>
              {this.printAllergies()}
              <div>
                  <a href="#" className="btn btn-primary" onClick={ this.addNewAllergy.bind(this) }>
                    <i className="fa fa-fw fa-plus"/>
                    Add
                  </a>
              </div>
              <br/>
          </div>
        );
    }
}