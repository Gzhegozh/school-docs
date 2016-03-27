class Allergy extends React.Component {
    constructor(props){
        super(props);
    }

    render(){
        return (
            <div>
                <input className="form-control"
                       type="text"
                       placeholder="Target"
                       ref={ (ref) => this.target = ref }/>
                <br/>
            </div>
        );
    }
}