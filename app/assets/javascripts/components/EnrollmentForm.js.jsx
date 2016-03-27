class EnrollmentForm extends React.Component {
    constructor(props){
        super(props);
        this.items = props.items;
        this.state = {clicked: 0};
    }

    indexChange(index){
        this.setState({clicked: index})
    }
    clickNextButton(e){
        e.preventDefault();
        var index = this.state.clicked;
        var length = this.items.length;
        if( index < length-1)
            this.setState({clicked: this.items.indexOf(this.items[index + 1]) || this.state.clicked});
    }
    render(){
        return (
            <div>
                <FormMenu items={ this.props.items }
                          clicked={ this.state.clicked }
                          onIndexChange={ this.indexChange.bind(this) } />
                { this.renderSection(this.props.items[this.state.clicked]) }
                <div className="row">
                    <div className="col-md-10">
                        <div className="progress">
                            <div className="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
                                 aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style={{width: '40%'}}>
                                40% Complete (success)
                            </div>
                        </div>
                    </div>
                    <div className="col-md-2">
                        <a href='#' className="btn btn-success" onClick={ this.clickNextButton.bind(this) }>
                            Next section &rarr;
                        </a>
                    </div>
                </div>
            </div>
        );
    }


    renderSection(item){
        switch (item){
            case 'Basics':
                return (<BasicsPage/>);
            case 'Extra':
                return (<ExtraPage/>);
            case 'Medications':
                return (<MedicationsPage/>);
            default:
                return (<ErrorPage/>);
        }
    }

    renderBasics(){
        <BasicsPage/>
    }
}