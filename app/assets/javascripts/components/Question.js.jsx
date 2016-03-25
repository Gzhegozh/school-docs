class Question extends React.Component {
    constructor(props){
        super(props);
    }

    render(){
        return (
            <div className="row">
                <div className="col-lg-4">
                    You are awesome?
                </div>
                <div className="col-lg-8">
                    <input type="text" className="form-control" ref={ (ref) => this.answer = ref }/>
                </div>
            </div>
        );
    }
}