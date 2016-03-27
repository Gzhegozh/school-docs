class Allergy extends React.Component {
    constructor(props){
        super(props);
    }

    render(){
        return (
            <input className="form-control" type="text" ref={ (ref) => this.target = ref }/>
        );
    }
}