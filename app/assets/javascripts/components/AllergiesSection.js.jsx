class AllergiesSection extends React.Component {
    constructor(props){
        super(props);
        this.state = {alls: []}
    }

    printAllergies(){
        return '';
    }

    addNewAllergy(e){
        e.preventDefault();
        var alls = this.state.alls;
        alls.push(1);
        this.setState({alls: alls});
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
              {this.state.alls.map((item,index) => {
                  return <Allergy/>;
              })}
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