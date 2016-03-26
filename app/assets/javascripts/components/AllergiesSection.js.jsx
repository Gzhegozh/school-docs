class AllergiesSection extends React.Component {
    constructor(props){
        super(props);
    }

    render(){
        return (
          <div>
              <h3>Put here allergies child's allergies</h3>
              <Allergy/>
              <Allergy/>
              <br/>
          </div>
        );
    }
}