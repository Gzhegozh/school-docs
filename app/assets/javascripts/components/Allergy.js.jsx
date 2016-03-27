class Allergy extends React.Component {
    constructor(props){
        super(props);
    }

    updateAllergy(e){
        e.preventDefault();
        this.props.updateAllergy(this.target.value, this.props.index);
    }

    componentDidMount(){
        this.target.value = this.props.target;
    }

    render(){
        return (
            <div>
                <input className="form-control"
                       type="text"
                       placeholder="Target"
                       ref={ (ref) => this.target = ref }
                       onChange={ this.updateAllergy.bind(this) }
                />
                <br/>
            </div>
        );
    }
}