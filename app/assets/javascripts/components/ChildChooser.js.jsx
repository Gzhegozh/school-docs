class ChildChooser extends React.Component{
    constructor(props){
        super(props);
        this.state = { choosed: false };
    }

    chooseChild(child){
        this.setState({choosed: true});
        this.child = child;
    }

    render(){
        return(
            <div className="row">
                <div className="col-lg-3">
                    <h4>Choose child to enroll:</h4>
                </div>
                <div className="col-lg-9">
                    {this.renderContent()}
                </div>
            </div>
        );
    }

    renderContent(){
        if(this.state.choosed){
            return this.renderResult();
        }else{
            return this.renderChilds();
        }
    }

    renderChilds(){
        return(
            this.props.childs.map((child, index) => {
                return(<ChildBlock chooseChild={ this.chooseChild.bind(this) }
                                   child={child}
                />);
            })
        );
    }
    renderResult(){
        return(
            <h4>
                <small>
                    { this.child }
                </small>
            </h4>
        );
    }
}