class AllergiesSection extends React.Component {
    constructor(props){
        super(props);
        this.state = {allergies: []};
    }

    addNewAllergy(e){
        e.preventDefault();
        var allergies = this.state.allergies;
        allergies.push('');
        this.setState({allergies: allergies});
        this.props.updatePercentage(data.type, this.calculatePercentage());
    }

    calculatePercentage(){
        var count = 0;
        if(this.state.allergies.length == 0)
            return 1;
        this.state.allergies.map((item) => {
            if(item && (item != ''))
                count += 1;
        });
        return (count / this.state.allergies.length);
    }

    updateAllergy(target, index){
        var data = {};
        data.type = 'Allergies';
        var allergies = this.state.allergies;
        allergies[index] = target;

        this.setState({allergies: allergies});
        data.allergies = allergies;
        this.props.updateData(data);
        this.props.updatePercentage(data.type, this.calculatePercentage());
    }

    componentWillMount(){
        props = this.props;
        if(props.values){
            this.setState({allergies: props.values.allergies});
        }
        this.props.updatePercentage('Allergies', this.calculatePercentage());
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
              <br/>
              {this.state.allergies.map((target, index) => {
                  return <Allergy updateAllergy={ this.updateAllergy.bind(this) }
                                  target={this.state.allergies[index]}
                                  key={ index }
                                  index={ index }
                  />;
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