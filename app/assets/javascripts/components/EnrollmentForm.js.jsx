class EnrollmentForm extends React.Component {
    constructor(props){
        super(props);
        this.state = {clicked: 0};
        console.log(this);
    }

    indexChange(index){
        this.setState({clicked: index})
    }

    render(){
        return (
            <div>
                <FormMenu items={ this.props.items }
                          clicked={ this.state.clicked }
                          onIndexChange={ this.indexChange.bind(this) } />
            </div>
        )
    }
}