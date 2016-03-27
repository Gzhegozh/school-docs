class Question extends React.Component {
    constructor(props){
        super(props);
    }

    updateAnswer(){
        this.props.updateAnswer(this.props.title, this.answer.value);
    }

    componentDidMount(){
        this.answer.value = this.props.answer || '';
    }

    render(){
        return (
            <div className="row">
                <label className="col-lg-4 control-label">
                    {this.props.title}
                </label>
                <div className="col-lg-8">
                    <input type="text"
                           className="form-control"
                           ref={ (ref) => this.answer = ref }
                           onChange={ this.updateAnswer.bind(this) }
                    />
                    <br/>
                </div>
            </div>
        );
    }
}